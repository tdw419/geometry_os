; DESCRIPTION: Renders a cyan box of size 112x59 starting at (103, 24).
; PLAN: r0=103(x), r1=24(y), r2=112(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 24
LDI r2, 112
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
