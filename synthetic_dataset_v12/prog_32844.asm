; DESCRIPTION: Places a cyan 105x105 rectangle at position (357, 29).
; PLAN: r0=357(x), r1=29(y), r2=105(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 29
LDI r2, 105
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
