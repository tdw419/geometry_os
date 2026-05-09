; DESCRIPTION: Renders a cyan box of size 90x71 starting at (33, 79).
; PLAN: r0=33(x), r1=79(y), r2=90(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 79
LDI r2, 90
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
