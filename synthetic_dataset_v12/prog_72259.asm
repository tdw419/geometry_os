; DESCRIPTION: Renders a cyan box of size 98x35 starting at (59, 4).
; PLAN: r0=59(x), r1=4(y), r2=98(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 4
LDI r2, 98
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
