; DESCRIPTION: Renders a cyan box of size 90x52 starting at (68, 113).
; PLAN: r0=68(x), r1=113(y), r2=90(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 113
LDI r2, 90
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
