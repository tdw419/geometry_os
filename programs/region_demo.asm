; region_demo.asm -- Spatial contract preprocessor demo
; Demonstrates REGION/ENDR macros for bounded, composable drawing.

; Define some colors
VAR c_red   0xFF0000
VAR c_green 0x00FF00
VAR c_blue  0x0000FF
VAR c_black 0x000000

; Top status bar
REGION status, 0, 0, 256, 16, bg=c_blue
  TEXTI 4, 4, "STATUS"
ENDR

; Main content area
REGION content, 0, 16, 256, 224, bg=c_black
  ; Draw a few pixels relative to content area
  PSETI 10, 10, 0xFF0000
  PSETI 11, 10, 0xFF0000
  PSETI 12, 10, 0xFF0000

  ; Nested panel inside content
  REGION sidebar, 200, 20, 50, 100, bg=c_green
    TEXTI 4, 4, "MENU"
  ENDR
ENDR

; Bottom strip, shared for child processes
REGION footer, 0, 240, 256, 16, bg=c_blue, SHARED
  TEXTI 4, 4, "FOOTER"
ENDR

HALT
