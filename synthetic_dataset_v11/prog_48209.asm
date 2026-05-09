; DESCRIPTION: Places a cyan 113x59 rectangle at position (77, 47).
; PLAN: r0=77(x), r1=47(y), r2=113(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 47
LDI r2, 113
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
