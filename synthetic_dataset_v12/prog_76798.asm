; DESCRIPTION: Places a red 96x72 rectangle at position (242, 60).
; PLAN: r0=242(x), r1=60(y), r2=96(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 60
LDI r2, 96
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
