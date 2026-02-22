# Specification: ace

Specification for Component: Ace (Area, Priority: High)

1. Component Purpose:
The purpose of Ace is to determine the area of a given shape within specified tolerance. It should be able to calculate this value accurately and efficiently.

2. Interface Definition:
Ace shall consist of a function that takes in one argument - the shape to be tested, and returns its calculated area. This function shall not modify or alter the shape inputted by the user.

3. Behavior Specification:
The Ace function shall perform the following steps when called:
- Check if the inputted shape is a valid rectangle.
- If it is valid, calculate its area using the formula: A = (length1 * height1) + (length2 * height2).
- Return this calculated value as output.

4. Performance Requirements:
Ace shall be optimized for performance by minimizing the number of calculations required to determine the area of a given shape. The function should run in O(1) time complexity, regardless of the size or complexity of the inputted shape. Ace shall also be able to handle shapes with different sizes and shapes.

5. Error Handling:
Ace shall implement robust error handling by checking for invalid input conditions such as negative dimensions, invalid shapes, etc. The function shall return an appropriate error message and/or exception to the caller in case of non-conforming inputs.