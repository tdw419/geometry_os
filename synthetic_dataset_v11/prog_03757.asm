; DESCRIPTION: Renders a cyan box of size 23x23 starting at (59, 166).
; PLAN: r0=59(x), r1=166(y), r2=23(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 166
LDI r2, 23
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
