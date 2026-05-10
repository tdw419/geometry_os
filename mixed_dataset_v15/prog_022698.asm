; DESCRIPTION: Places a white 22x86 rectangle at position (160, 16).
; PLAN: r0=160(x), r1=16(y), r2=22(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 16
LDI r2, 22
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
