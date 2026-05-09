; DESCRIPTION: Renders a green box of size 27x67 starting at (39, 50).
; PLAN: r0=39(x), r1=50(y), r2=27(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 50
LDI r2, 27
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
