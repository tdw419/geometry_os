; DESCRIPTION: Places a cyan 82x92 rectangle at position (103, 153).
; PLAN: r0=103(x), r1=153(y), r2=82(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 153
LDI r2, 82
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
