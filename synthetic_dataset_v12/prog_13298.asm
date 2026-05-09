; DESCRIPTION: Places a cyan 120x100 rectangle at position (357, 135).
; PLAN: r0=357(x), r1=135(y), r2=120(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 135
LDI r2, 120
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
