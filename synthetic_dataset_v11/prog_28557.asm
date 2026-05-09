; DESCRIPTION: Renders a cyan box of size 25x38 starting at (59, 6).
; PLAN: r0=59(x), r1=6(y), r2=25(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 6
LDI r2, 25
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
