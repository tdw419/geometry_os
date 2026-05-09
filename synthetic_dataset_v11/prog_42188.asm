; DESCRIPTION: Places a cyan 51x92 rectangle at position (154, 121).
; PLAN: r0=154(x), r1=121(y), r2=51(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 121
LDI r2, 51
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
