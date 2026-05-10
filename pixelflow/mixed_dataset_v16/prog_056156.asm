; DESCRIPTION: Renders a cyan box of size 14x90 starting at (117, 121).
; PLAN: r0=117(x), r1=121(y), r2=14(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 121
LDI r2, 14
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
