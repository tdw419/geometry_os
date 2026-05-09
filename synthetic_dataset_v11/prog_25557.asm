; DESCRIPTION: Renders a cyan box of size 36x11 starting at (121, 57).
; PLAN: r0=121(x), r1=57(y), r2=36(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 57
LDI r2, 36
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
