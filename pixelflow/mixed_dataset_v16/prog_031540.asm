; DESCRIPTION: Places a white 22x44 rectangle at position (27, 13).
; PLAN: r0=27(x), r1=13(y), r2=22(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 13
LDI r2, 22
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
