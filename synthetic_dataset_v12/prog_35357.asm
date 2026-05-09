; DESCRIPTION: Places a yellow 106x60 rectangle at position (242, 100).
; PLAN: r0=242(x), r1=100(y), r2=106(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 100
LDI r2, 106
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
