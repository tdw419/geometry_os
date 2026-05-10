; DESCRIPTION: Renders a green box of size 103x82 starting at (158, 143).
; PLAN: r0=158(x), r1=143(y), r2=103(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 143
LDI r2, 103
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
