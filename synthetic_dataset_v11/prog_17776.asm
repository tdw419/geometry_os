; DESCRIPTION: Renders a cyan box of size 109x44 starting at (31, 174).
; PLAN: r0=31(x), r1=174(y), r2=109(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 174
LDI r2, 109
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
