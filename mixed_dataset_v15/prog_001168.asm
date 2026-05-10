; DESCRIPTION: Renders a cyan box of size 59x36 starting at (417, 29).
; PLAN: r0=417(x), r1=29(y), r2=59(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 29
LDI r2, 59
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
