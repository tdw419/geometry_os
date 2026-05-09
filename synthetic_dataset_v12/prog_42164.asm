; DESCRIPTION: Renders a purple box of size 61x92 starting at (215, 103).
; PLAN: r0=215(x), r1=103(y), r2=61(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 103
LDI r2, 61
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
