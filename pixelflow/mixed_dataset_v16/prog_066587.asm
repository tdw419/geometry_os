; DESCRIPTION: Renders a yellow box of size 120x74 starting at (59, 146).
; PLAN: r0=59(x), r1=146(y), r2=120(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 146
LDI r2, 120
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
