; DESCRIPTION: Renders a cyan box of size 10x94 starting at (327, 117).
; PLAN: r0=327(x), r1=117(y), r2=10(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 117
LDI r2, 10
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
