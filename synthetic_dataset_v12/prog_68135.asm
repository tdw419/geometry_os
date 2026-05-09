; DESCRIPTION: Places a white 46x100 rectangle at position (110, 132).
; PLAN: r0=110(x), r1=132(y), r2=46(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 132
LDI r2, 46
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
