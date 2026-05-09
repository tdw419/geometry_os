; DESCRIPTION: Places a red 25x72 rectangle at position (242, 40).
; PLAN: r0=242(x), r1=40(y), r2=25(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 40
LDI r2, 25
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
