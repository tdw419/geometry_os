; DESCRIPTION: Renders a green box of size 104x107 starting at (32, 143).
; PLAN: r0=32(x), r1=143(y), r2=104(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 143
LDI r2, 104
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
