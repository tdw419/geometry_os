; DESCRIPTION: Renders a cyan box of size 72x74 starting at (81, 117).
; PLAN: r0=81(x), r1=117(y), r2=72(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 117
LDI r2, 72
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
