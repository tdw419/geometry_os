; DESCRIPTION: Renders a cyan box of size 59x120 starting at (31, 39).
; PLAN: r0=31(x), r1=39(y), r2=59(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 39
LDI r2, 59
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
