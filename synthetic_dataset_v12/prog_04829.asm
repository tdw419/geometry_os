; DESCRIPTION: Renders a cyan box of size 48x98 starting at (65, 68).
; PLAN: r0=65(x), r1=68(y), r2=48(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 68
LDI r2, 48
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
