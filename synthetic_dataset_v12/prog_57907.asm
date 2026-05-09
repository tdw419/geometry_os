; DESCRIPTION: Places a white 33x96 rectangle at position (264, 154).
; PLAN: r0=264(x), r1=154(y), r2=33(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 154
LDI r2, 33
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
