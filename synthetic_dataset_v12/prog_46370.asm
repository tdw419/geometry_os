; DESCRIPTION: Renders a cyan box of size 21x94 starting at (68, 117).
; PLAN: r0=68(x), r1=117(y), r2=21(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 117
LDI r2, 21
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
