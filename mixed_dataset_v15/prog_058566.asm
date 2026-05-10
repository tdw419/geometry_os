; DESCRIPTION: Renders a green box of size 61x61 starting at (433, 154).
; PLAN: r0=433(x), r1=154(y), r2=61(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 154
LDI r2, 61
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
