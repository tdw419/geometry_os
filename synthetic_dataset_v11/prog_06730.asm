; DESCRIPTION: Renders a green box of size 82x90 starting at (150, 16).
; PLAN: r0=150(x), r1=16(y), r2=82(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 16
LDI r2, 82
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
