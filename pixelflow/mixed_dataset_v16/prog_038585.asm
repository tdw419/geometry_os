; DESCRIPTION: Renders a cyan box of size 68x112 starting at (439, 140).
; PLAN: r0=439(x), r1=140(y), r2=68(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 140
LDI r2, 68
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
