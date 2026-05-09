; DESCRIPTION: Renders a green box of size 98x45 starting at (13, 146).
; PLAN: r0=13(x), r1=146(y), r2=98(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 146
LDI r2, 98
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
