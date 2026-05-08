; Single red pixel at position (10, 10)
; Minimal test: PSET with specific coordinates and color

LDI r0, 10        ; x = 10
LDI r1, 10        ; y = 10
LDI r2, 0xFF0000  ; color = red (R=FF, G=00, B=00)
PSET r0, r1, r2

HALT
