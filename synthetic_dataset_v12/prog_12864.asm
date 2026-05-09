; DESCRIPTION: Places a yellow 28x111 rectangle at position (450, 100).
; PLAN: r0=450(x), r1=100(y), r2=28(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 100
LDI r2, 28
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
