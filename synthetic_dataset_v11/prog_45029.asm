; DESCRIPTION: Renders a cyan box of size 38x71 starting at (198, 162).
; PLAN: r0=198(x), r1=162(y), r2=38(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 162
LDI r2, 38
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
