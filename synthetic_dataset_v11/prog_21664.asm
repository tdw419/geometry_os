; DESCRIPTION: Renders a cyan box of size 67x48 starting at (140, 94).
; PLAN: r0=140(x), r1=94(y), r2=67(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 94
LDI r2, 67
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
