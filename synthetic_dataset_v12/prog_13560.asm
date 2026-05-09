; DESCRIPTION: Places a yellow 92x95 rectangle at position (214, 124).
; PLAN: r0=214(x), r1=124(y), r2=92(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 124
LDI r2, 92
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
