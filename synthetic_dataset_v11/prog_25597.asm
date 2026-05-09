; DESCRIPTION: Renders a cyan box of size 27x23 starting at (169, 183).
; PLAN: r0=169(x), r1=183(y), r2=27(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 183
LDI r2, 27
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
