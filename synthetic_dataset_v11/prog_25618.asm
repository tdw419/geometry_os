; DESCRIPTION: Places a cyan 36x76 rectangle at position (92, 82).
; PLAN: r0=92(x), r1=82(y), r2=36(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 82
LDI r2, 36
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
