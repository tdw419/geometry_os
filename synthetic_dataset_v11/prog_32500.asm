; DESCRIPTION: Places a yellow 13x16 rectangle at position (242, 109).
; PLAN: r0=242(x), r1=109(y), r2=13(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 109
LDI r2, 13
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
