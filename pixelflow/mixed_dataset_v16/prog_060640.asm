; DESCRIPTION: Renders a cyan box of size 106x106 starting at (17, 146).
; PLAN: r0=17(x), r1=146(y), r2=106(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 146
LDI r2, 106
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
