; DESCRIPTION: Renders a cyan rectangular region spanning 34 by 48 at (237, 194).
; PLAN: r0=237(x), r1=194(y), r2=34(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 194
LDI r2, 34
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
