; DESCRIPTION: Places a cyan 59x77 rectangle at position (127, 113).
; PLAN: r0=127(x), r1=113(y), r2=59(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 113
LDI r2, 59
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
