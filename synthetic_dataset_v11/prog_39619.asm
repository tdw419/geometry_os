; DESCRIPTION: Renders a cyan box of size 72x85 starting at (166, 141).
; PLAN: r0=166(x), r1=141(y), r2=72(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 141
LDI r2, 72
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
