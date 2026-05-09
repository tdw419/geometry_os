; DESCRIPTION: Places a white 18x31 rectangle at position (242, 222).
; PLAN: r0=242(x), r1=222(y), r2=18(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 222
LDI r2, 18
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
