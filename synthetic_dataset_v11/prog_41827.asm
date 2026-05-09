; DESCRIPTION: Renders a cyan box of size 102x36 starting at (103, 133).
; PLAN: r0=103(x), r1=133(y), r2=102(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 133
LDI r2, 102
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
