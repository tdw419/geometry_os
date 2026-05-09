; DESCRIPTION: Renders a green box of size 48x11 starting at (146, 173).
; PLAN: r0=146(x), r1=173(y), r2=48(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 173
LDI r2, 48
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
