; DESCRIPTION: Renders a cyan box of size 75x107 starting at (166, 104).
; PLAN: r0=166(x), r1=104(y), r2=75(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 104
LDI r2, 75
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
