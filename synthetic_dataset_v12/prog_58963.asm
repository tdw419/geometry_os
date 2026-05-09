; DESCRIPTION: Places a white 46x78 rectangle at position (154, 22).
; PLAN: r0=154(x), r1=22(y), r2=46(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 22
LDI r2, 46
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
