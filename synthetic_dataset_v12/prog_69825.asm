; DESCRIPTION: Renders a cyan box of size 48x39 starting at (302, 162).
; PLAN: r0=302(x), r1=162(y), r2=48(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 162
LDI r2, 48
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
