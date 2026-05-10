; DESCRIPTION: Renders a cyan box of size 95x92 starting at (387, 0).
; PLAN: r0=387(x), r1=0(y), r2=95(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 0
LDI r2, 95
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
