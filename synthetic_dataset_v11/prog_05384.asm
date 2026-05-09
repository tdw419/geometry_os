; DESCRIPTION: Renders a cyan box of size 61x33 starting at (14, 150).
; PLAN: r0=14(x), r1=150(y), r2=61(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 150
LDI r2, 61
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
